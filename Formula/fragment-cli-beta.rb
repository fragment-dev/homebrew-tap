require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5892.0.0-darwin-x64.tar.gz"
    sha256 "7fdd2eddd367a6ae54d7365bfdd4f5158b34f55dbc1f34b55d41710e25692175"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5892.0.0-darwin-arm64.tar.gz"
      sha256 "50c58b397ce192db877161be19b16ed64fcd5013b9c7e315aaf3d63d6c14fc35"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5892.0.0-linux-x64.tar.gz"
    sha256 "9d42adc48c06d29843e13d90aab30ab9be28f675346b902970126fd459a95d09"
  end
  version "5892.0.0"
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
