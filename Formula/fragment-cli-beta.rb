require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4083.0.0-darwin-x64.tar.gz"
    sha256 "1a0b8c082be34f9b1d3c3e1c9dbda1f93dfdd3639f234bbe84bc2cb110cc642f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4083.0.0-darwin-arm64.tar.gz"
      sha256 "bb6afc6975454a3ea02494f5b2ba6b5fb7d80a402e700cea9c800b65812f5be2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4083.0.0-linux-x64.tar.gz"
    sha256 "6dea60d709a1e9ee1199b6230cccc0f897a34e191709d75583c1e62c02a52e06"
  end
  version "4083.0.0"
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
