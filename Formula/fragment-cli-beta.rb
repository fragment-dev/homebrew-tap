require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2432.0.0-darwin-x64.tar.gz"
    sha256 "a13be66e101370d27090acf7606f9c5d8891319907b84c7b9050bc0760317202"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2432.0.0-darwin-arm64.tar.gz"
      sha256 "1ac25c782819a87fe8cebf8dd6b144c2d4febdd9f91d1b5cb24965b9e6773d14"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2432.0.0-linux-x64.tar.gz"
    sha256 "7a8d1edf46272dbf2f574caa6b55bdce494d0764b53f65f1badbbdcdc26597a5"
  end
  version "2432.0.0"
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
