using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestMatrix : MonoBehaviour {

	public float cordW;
	// Use this for initialization
	void Start () {

		cordW = GetComponent<MeshRenderer> ().materials[0].GetFloat ("_CordW");
	}

	void Update(){
		cordW = GetComponent<MeshRenderer> ().materials[0].GetFloat ("_CordW");
	}
}
