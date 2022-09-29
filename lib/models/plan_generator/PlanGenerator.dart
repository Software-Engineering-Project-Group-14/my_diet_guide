import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';



class PlanGenerator{

  Map<String, Map<String,  List<String> >> meals = {
    /*
    "Breakfast": {
      "0-12": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      },
      "13-18": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      },
      "19-25": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      },
      "26-45": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      },
      "46-60": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      },
      "61-75": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      },
      "More than 75": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      }
    },
    "Lunch": {
      "0-12": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      },
      "13-18": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      },
      "19-25": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      },
      "26-45": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      },
      "46-60": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      },
      "61-75": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      },
      "More than 75": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      }
    },
    "Dinner": {
      "0-12": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      },
      "13-18": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      },
      "19-25": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      },
      "26-45": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      },
      "46-60": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      },
      "61-75": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      },
      "More than 75": {
        "Energetic": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
        },
        "Low carb": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        },
        "Vegetarian": {
          "Not very active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Moderately active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },
          "Active": {
            "Easy": {
              "Male": [],
              "Female": []
            },
            "Standard": {
              "Male": [],
              "Female": []
            },
            "Difficult": {
              "Male": [],
              "Female": []
            }
          },

        }
      }
    },
     */
    "Breakfast": {
      "Energetic": [],
      "Low carb": [],
      "Vegetarian":[]
    },
    "Lunch": {
      "Energetic": [],
      "Low carb": [],
      "Vegetarian":[]
    },
    "Dinner":{
      "Energetic": [],
      "Low carb": [],
      "Vegetarian":[]
    }
  };

  Future<void> init() async{
    DocumentSnapshot ds = await FirebaseFirestore.instance.collection("breakfast").doc("details").get();
    int breakfastCount = ds["count"];
    ds = await FirebaseFirestore.instance.collection("lunch").doc("details").get();
    int lunchCount = ds["count"];
    ds = await FirebaseFirestore.instance.collection("dinner").doc("details").get();
    int dinnerCount = ds["count"];
    for(int i=1;i<=breakfastCount;i++){
      print(i);
     ds =   await FirebaseFirestore.instance.collection("breakfast").doc(i.toString()).get();
    //print(meals["Breakfast"]! [ds["age_group"]]! [ds["dietary_preference"]] ![ds["activeness"]] ![ds["intensity"]]! [ds["gender"]]!);
     //meals["Breakfast"]! [ds["age_group"]]! [ds["dietary_preference"]] ![ds["activeness"]] ![ds["intensity"]]! [ds["gender"]]!.add(i.toString());
      meals["Breakfast"]![ds["dietary_preference"]]!.add(i.toString());
     // print(meals["Breakfast"]! [ds["age_group"]]! [ds["dietary_preference"]] ![ds["activeness"]] ![ds["intensity"]]! [ds["gender"]]!);
    }
    for(int j=1;j<=lunchCount;j++){
      print(j);
      ds =   await FirebaseFirestore.instance.collection("lunch").doc(j.toString()).get();
      meals["Lunch"]![ds["dietary_preference"]]!.add(j.toString());
      //meals["Lunch"]! [ds["age_group"]]! [ds["dietary_preference"]] ![ds["activeness"]] ![ds["intensity"]]! [ds["gender"]]!.add(j.toString());
    }
    for(int k=1;k<=dinnerCount;k++){
      print(k);
      ds =   await FirebaseFirestore.instance.collection("dinner").doc(k.toString()).get();
      meals["Dinner"]![ds["dietary_preference"]]!.add(k.toString());
     // meals["Dinner"]! [ds["age_group"]]! [ds["dietary_preference"]] ![ds["activeness"]] ![ds["intensity"]]! [ds["gender"]]!.add(k.toString());
    }
  }

  Future<void> generate() async{

    await init();
    print(meals);
    print("aaa");


    for(int i=0;i<=100;i++){
      print(i);
      String intensity = getRandomIntensity();
      String activeness = getRandomActiveness();
      String age_group = getRandomAgeGroup();
      String dietaryPreferance = getDietaryPreferance();
      String gender = getRandomGender();
      String breakfastMeal = getRandomMeal("Breakfast", dietaryPreferance);
      String lunchMeal = getRandomMeal("Lunch",  dietaryPreferance);
      String dinnerMeal = getRandomMeal("Dinner",  dietaryPreferance);
      await FirebaseFirestore.instance.collection("diet_plan").doc(i.toString())
          .set({
        "activeness": activeness,
        "age_group": age_group,
        "dietary_preference": dietaryPreferance,
        "gender": gender,
        "intensity": intensity,
        "breakfast_id": breakfastMeal,
        "lunch_id": lunchMeal,
        "dinner_id": dinnerMeal
      });
    }






  }

  String getRandomMeal(mealType, dietaryPreferance){
    List<String> t =  meals[mealType]![dietaryPreferance]!;
  //  print(meals[mealType]![age_group]![dietaryPreferance]!);
    if(t.length==0){
     // print("xx");
      return "";
    }else{
      return t[Random().nextInt(t.length)];
    }
  }

  String getRandomIntensity(){
    List<String> intensityValues = [
      "Easy",
      "Standard",
      "Difficult"
    ];
    return intensityValues[Random().nextInt(intensityValues.length)];
  }

  String getRandomActiveness(){
    List<String> activenessValues = [
      "Not very active",
      "Moderately active",
      "Active",
    ];
    return activenessValues[Random().nextInt(activenessValues.length)];
  }

  String getRandomAgeGroup(){
    List<String> ageGroupValues = [
      "0-12",
      "13-18",
      "19-25",
      "26-45",
      "46-60",
      "61-75",
      "More than 75"
    ];
    return ageGroupValues[Random().nextInt(ageGroupValues.length)];
  }

  String getDietaryPreferance(){
    List<String> dietaryPreferanceValues = [
      "Energetic",
      "Low carb",
      "Vegetarian"
    ];
    return dietaryPreferanceValues[Random().nextInt(dietaryPreferanceValues.length)];
  }

  String getRandomGender(){
    List<String> genderValues = ["Male", "Female"];
    return genderValues[Random().nextInt(2)];
  }

}