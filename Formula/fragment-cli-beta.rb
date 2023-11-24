require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4040.0.0-darwin-x64.tar.gz"
    sha256 "a2efc70994c132e63458d8861f5e72cbd2a479ceb625971238b11ddf9386bbff"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4040.0.0-darwin-arm64.tar.gz"
      sha256 "33f02cabfd3cc11a0b1ff3bc18cd5dcbcdc20787f65736603f92331faf42587f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4040.0.0-linux-x64.tar.gz"
    sha256 "33e9de31b9c4511d8a83830e51e1145ed52d5ad3cfea9674dd08b2ec406b9ccc"
  end
  version "4040.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
