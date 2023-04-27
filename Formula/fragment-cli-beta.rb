require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2536.0.0-darwin-x64.tar.gz"
    sha256 "398d81e11768db06667f2cc165542659426c6f0782e61cd2a8a8b19992127c62"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2536.0.0-darwin-arm64.tar.gz"
      sha256 "9a60d8bf379a9abece66e0ed3867dfd2febc958c639bd9b23b4efafa48de5a46"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2536.0.0-linux-x64.tar.gz"
    sha256 "b4488ff9c77b08e02f62471fbd5ae2c3a0c98cb7579f16e052ec42e44f1137ee"
  end
  version "2536.0.0"
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
