require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3688.0.0-darwin-x64.tar.gz"
    sha256 "52b16a8e5e353487d80afb1f7cae5451c54cbf578ec5108115be6da756fbc9ba"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3688.0.0-darwin-arm64.tar.gz"
      sha256 "72d561a252c804ff53796acf9e9a778b0a3153622ea3c62a2daf6b727ad27046"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3688.0.0-linux-x64.tar.gz"
    sha256 "66b004b1fb9ec2ba4479a187a25c2d19f3c6b90d7ef62f536478305e8e455b9b"
  end
  version "3688.0.0"
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
