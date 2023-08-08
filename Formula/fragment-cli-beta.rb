require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3254.0.0-darwin-x64.tar.gz"
    sha256 "eef862497e640bace28bafc293fd5e7cb837d7508b429e1289b10d48867fbfee"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3254.0.0-darwin-arm64.tar.gz"
      sha256 "1e1252426919610ca91fb4a9a0c08744466783aeba76541d368bbdd5b6662cfd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3254.0.0-linux-x64.tar.gz"
    sha256 "f2fa7853c699cb9d3da6df3b12e9ced303755b4d2be65d3e6736c1f42a714fda"
  end
  version "3254.0.0"
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
