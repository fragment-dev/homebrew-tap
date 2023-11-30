require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4069.0.0-darwin-x64.tar.gz"
    sha256 "aced4b5db625fb1eb0c4bb3922be72f22572e5bbdaff13ab3bb583c541d990f0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4069.0.0-darwin-arm64.tar.gz"
      sha256 "29b3542a8e2e08c8b1efb77204715ef3cc64763e53f3d5cbbc6b1d53ef6fa619"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4069.0.0-linux-x64.tar.gz"
    sha256 "8a0a35ef25669ad9e6b3dd5d8d97ebb7e5bfa1c7e2cd1a4ae67a6a3cfa3e5e61"
  end
  version "4069.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
