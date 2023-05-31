require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2762.0.0-darwin-x64.tar.gz"
    sha256 "9e1073656b2e01604a154d6a585d1e260cad927a34ec4cd14e49f07ca72ba3ba"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2762.0.0-darwin-arm64.tar.gz"
      sha256 "c085344fe0e29f9a4f0f923c2a7d93add16cae435291a33b6c98c9b1970e0e1a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2762.0.0-linux-x64.tar.gz"
    sha256 "a996e62b5a9c3d6276bc928d83389a932ee2f06bcf83c595de16424f5ded1e80"
  end
  version "2762.0.0"
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
