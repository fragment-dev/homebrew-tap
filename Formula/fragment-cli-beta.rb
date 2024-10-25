require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5701.0.0-darwin-x64.tar.gz"
    sha256 "b14e455b3cce6493e0f580d0f294da1b67a0737d2cb8628e9fd20e3a85a53fe4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5701.0.0-darwin-arm64.tar.gz"
      sha256 "b0e05ea00a202579cf95fdc8940859a6436dfa88b241b433b0c6020d1e437045"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5701.0.0-linux-x64.tar.gz"
    sha256 "c93a5f5ce6f5abda81a3e918fee0ab498b6509cc223ebd7070632334031f025f"
  end
  version "5701.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
