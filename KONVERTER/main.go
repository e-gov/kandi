package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"os"

	xj "github.com/txix-open/goxml2json"
)

func main() {

	// Ava sisendfail
	file, err := os.Open("../ANDMED/ELECTION_CANDIDATES.xml")
	if err != nil {
		fmt.Println("XML-faili avamine ebaõnnestus")
		os.Exit(0)
	}

	// Ava väljundfail
	vf, err := os.Create("JSONTEST")
	if err != nil {
		panic("JSON-faili avamine ebaõnnestus")
	}
	// close fo on exit and check for its returned error
	defer func() {
		if err := vf.Close(); err != nil {
			panic(err)
		}
	}()

	// Loo Teisendaja
	converter := xj.NewConverter(
		xj.WithAttrPrefix("-"),
		xj.WithTypeConverter(xj.Float),
	)

	// Teisenda
	json_raw, err := converter.Convert(file)
	if err != nil {
		panic("Teisendamine ebaõnnestus")
	}

	// Pretty print
	var prettyJSON bytes.Buffer
	err := json.Indent(&prettyJSON, json_raw, "", "\t")

	// Väljasta JSON terminalile
	// fmt.Println(json.String())

	// Väljasta JSON faili
	_, err = vf.WriteString(prettyJSON.String())
	if err != nil {
		panic("JSON-faili väljastamine ebaõnnestus")
	}

}

// Märkmed:
// https://www.honeybadger.io/blog/comprehensive-guide-to-file-operations-in-go/
