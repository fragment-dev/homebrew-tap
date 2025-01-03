require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6029.0.0-darwin-x64.tar.gz"
    sha256 "4f0c0a5fbe727b71753730ce5abfe8dc6b11d91299ab3110f3c30ef14f35535b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6029.0.0-darwin-arm64.tar.gz"
      sha256 "a940e3f9ff5804435b45fe62aac70ed8c081dc0dda31cf3c3b5b91d21768d131"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6029.0.0-linux-x64.tar.gz"
    sha256 "2f4052bf0b96b32a8d2de1ee3f45762581d53acd93fcd52218c5f08d14c41ecc"
  end
  version "6029.0.0"
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
