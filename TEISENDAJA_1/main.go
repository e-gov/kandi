package main

// Kasutamine: vt README.md

import (
	"bytes"
	"encoding/json"
	"flag"
	"fmt"
	"os"

	xj "github.com/txix-open/goxml2json"
)

func main() {

	infilePtr := flag.String("infile", "ELECTION_CANDIDATES.xml", "XML-faili nimi")
	outfilePtr := flag.String("outfile", "ELECTION_CANDIDATES.xml", "JSON-faili nimi")
	flag.Parse()

	// Ava sisendfail
	infile, err := os.Open(*infilePtr)
	if err != nil {
		fmt.Println("XML-faili avamine ebaõnnestus")
		os.Exit(0)
	}

	// Ava väljundfail
	outfile, err := os.Create(*outfilePtr)
	if err != nil {
		panic("JSON-faili avamine ebaõnnestus")
	}
	// close fo on exit and check for its returned error
	defer func() {
		if err := outfile.Close(); err != nil {
			panic(err)
		}
	}()

	// Loo Teisendaja
	converter := xj.NewConverter(
		xj.WithAttrPrefix("-"),
		xj.WithTypeConverter(xj.Float),
	)

	// Teisenda
	json_raw, err := converter.Convert(infile)
	if err != nil {
		panic("Teisendamine ebaõnnestus")
	}

	// Pretty print
	var prettyJSON bytes.Buffer
	err = json.Indent(&prettyJSON, json_raw.Bytes(), "", "\t")

	// Väljasta JSON terminalile
	// fmt.Println(json.String())

	// Väljasta JSON faili
	_, err = outfile.WriteString(prettyJSON.String())
	if err != nil {
		panic("JSON-faili väljastamine ebaõnnestus")
	}

}

// Märkmed:
// https://www.honeybadger.io/blog/comprehensive-guide-to-file-operations-in-go/
