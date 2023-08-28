require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3402.0.0-darwin-x64.tar.gz"
    sha256 "575693a326e7aeb2e9020d8ff1691db1397801044c5433c40841cc11676cb074"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3402.0.0-darwin-arm64.tar.gz"
      sha256 "b6c28246d950bf27188e2aa57a4d5cdd250d36b4cb2d7dabdd5908592efa55ab"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3402.0.0-linux-x64.tar.gz"
    sha256 "7833e77886a30eb45add3406b5a35c604406a1fbacae8e23e124f089bb06a1d6"
  end
  version "3402.0.0"
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
