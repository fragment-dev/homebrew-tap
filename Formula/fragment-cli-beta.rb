require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5417.0.0-darwin-x64.tar.gz"
    sha256 "d1db3255839e7eb83c3631bc86dad1f42277a465788697fb9373ca49ebf89cbd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5417.0.0-darwin-arm64.tar.gz"
      sha256 "7265de8467239b4a6edb08761a0c2a3e5c939caa7f6bf5ca0e845154100a3f63"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5417.0.0-linux-x64.tar.gz"
    sha256 "919efff40f2c810ba2841bbfe8648f94de83d7b976e52edcce25e6718b97da3d"
  end
  version "5417.0.0"
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
