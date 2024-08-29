require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5554.0.0-darwin-x64.tar.gz"
    sha256 "77231dae47d12905e450ba65b09d3103f2b81568c6a769b62600e6b90197a0ff"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5554.0.0-darwin-arm64.tar.gz"
      sha256 "e87723622e6dae6022231cbf22aa2c33d9320bd522e5c612ec657463bae2f7ff"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5554.0.0-linux-x64.tar.gz"
    sha256 "f1ebcf43dd08f6cfb8a1ce28f8b6b09c80bc5a8b9a353d275d9dfe0a0a18ea75"
  end
  version "5554.0.0"
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
