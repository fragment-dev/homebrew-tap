require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4969.0.0-darwin-x64.tar.gz"
    sha256 "967d21da06f1600d1425d4fdc7ccf93c3bccd5d6f9b01659e1ba082dd19a4ab9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4969.0.0-darwin-arm64.tar.gz"
      sha256 "1b8b00b959c29f6fee4a54b6531304a8ccd5a8639773073328145c16ee1d330b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4969.0.0-linux-x64.tar.gz"
    sha256 "905010e9d6e4b8fb1eac5d9aa5da925c78f2839118357efa8488e2098d656f28"
  end
  version "4969.0.0"
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
