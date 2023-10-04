require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3763.0.0-darwin-x64.tar.gz"
    sha256 "7e41005c54d99ecf09e668cd38ed0eec238c092847e92726bacd01035aef57ac"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3763.0.0-darwin-arm64.tar.gz"
      sha256 "47b8c1f51bdb4f199892ba1ce88bf6212289e39900751844750f20f19ced7d6d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3763.0.0-linux-x64.tar.gz"
    sha256 "9887f0c30904fbb9d0cb095ac1429dff1ce79642f19d4067c09ba95b1d570b99"
  end
  version "3763.0.0"
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
