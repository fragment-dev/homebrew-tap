require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3307.0.0-darwin-x64.tar.gz"
    sha256 "8b737944b5df3a660783cbe7e30ffe70767adecd1d24ae7131c205a7f4622a98"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3307.0.0-darwin-arm64.tar.gz"
      sha256 "67f336a1c6ce69dbbff37cf9a99f44dc8d65146c6b25aa1a5b2a749913eae7c1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3307.0.0-linux-x64.tar.gz"
    sha256 "833adcb6b39de72aa328e5220d1d90232956806c6ac2aa35becd6765de0bc345"
  end
  version "3307.0.0"
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
