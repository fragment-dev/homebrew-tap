require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2496.0.0-darwin-x64.tar.gz"
    sha256 "0994902a004a1eebdd9cffd387396c0a2ee0fb5d1c6b23e483912428644b676f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2496.0.0-darwin-arm64.tar.gz"
      sha256 "2110a33e236555d80622fa0e6bb70699e100f64ab6c4f23d03bb2b93b5ec0613"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2496.0.0-linux-x64.tar.gz"
    sha256 "fc08b58a965b49b0f948aac2d6015c25d5358b2fa74cf8e9faea6e6310f5bc26"
  end
  version "2496.0.0"
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
