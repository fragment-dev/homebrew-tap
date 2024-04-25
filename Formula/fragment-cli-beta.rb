require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4945.0.0-darwin-x64.tar.gz"
    sha256 "b1ec3b35e24c51ad7968fd092299f4896b839b3c84b182af508353bcb1c46cf5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4945.0.0-darwin-arm64.tar.gz"
      sha256 "95769ac6c5541dd96ef475ff19dab8553806535a4c7f59af99e36c842fd8104b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4945.0.0-linux-x64.tar.gz"
    sha256 "b4b713d35487b09de7c5bcd3069671cb81d7178aead4eea8643c1bb1d3c1cd0e"
  end
  version "4945.0.0"
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
