require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2877.0.0-darwin-x64.tar.gz"
    sha256 "6e2df959c20a9c71d237dc07d1eeface1683b324929c9db64c4127a4771feaad"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2877.0.0-darwin-arm64.tar.gz"
      sha256 "79be7b17897d5c2a0258285fdd25250bc346da0b557d5bea18e5143697231f00"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2877.0.0-linux-x64.tar.gz"
    sha256 "2386c1703699268a52b76cec94dc7546606878fcd2a9b6f622f0011637ae0ae5"
  end
  version "2877.0.0"
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
