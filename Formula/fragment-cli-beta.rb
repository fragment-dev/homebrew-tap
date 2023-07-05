require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3006.0.0-darwin-x64.tar.gz"
    sha256 "633fcef0c408c72ccbe0806804e6828009161bbb094da1b7e8d76243f477b92d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3006.0.0-darwin-arm64.tar.gz"
      sha256 "e8d76bff278e5d145d410257ea1b1d3346964df11793dbe9d0445e9dc8d8af39"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3006.0.0-linux-x64.tar.gz"
    sha256 "6a598bf3ae8cf47a0139bd883c5ff739bd996fc3c07e0665a9c19cd6dd377bac"
  end
  version "3006.0.0"
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
