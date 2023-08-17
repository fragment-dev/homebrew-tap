require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3339.0.0-darwin-x64.tar.gz"
    sha256 "282c014dd960f3bc8da2a6d35b7cc6405b1ac87aa5ac760995d694ec427dce7e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3339.0.0-darwin-arm64.tar.gz"
      sha256 "74dd0ff55080e63988d9b233b0004af133e199be60a68efb6b844f9619eb703f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3339.0.0-linux-x64.tar.gz"
    sha256 "37cc4d151f7776c234a614baf77924851b8fc73c413fb539c89983fddd6d82b2"
  end
  version "3339.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
