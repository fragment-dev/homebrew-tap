require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6011.0.0-darwin-x64.tar.gz"
    sha256 "283f36148b03c88a3ff37c37d0f59c868305a782ba5cd46c0c5334f5b9f9fb8f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6011.0.0-darwin-arm64.tar.gz"
      sha256 "28f49134d17dc90aa5e5e77f04e29d0098963c22aaa7519b27566671f24d0e6b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6011.0.0-linux-x64.tar.gz"
    sha256 "365080a69889ec0cf5b626fd123507b77f687da2b233e234611595994534a9a5"
  end
  version "6011.0.0"
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
