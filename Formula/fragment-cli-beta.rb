require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3105.0.0-darwin-x64.tar.gz"
    sha256 "ad27cbd526b2d7ab92d235f70c40fdeb06100d0d5425729842c1334ad84faa7f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3105.0.0-darwin-arm64.tar.gz"
      sha256 "ced09588c2604411efce06d24cd50a7b07b4b28056e590be8fac0524f6356df9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3105.0.0-linux-x64.tar.gz"
    sha256 "cf5d06a673efbf4506b24bcdcd30955e800887a327fa13ef278c4b0e10444905"
  end
  version "3105.0.0"
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
