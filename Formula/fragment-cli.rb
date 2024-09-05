require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.4-darwin-x64.tar.gz"
    sha256 "5a598d8046da3a6e71fc742ffbba130475f50a5e802b2998b560ff5b3c65e507"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.4-darwin-arm64.tar.gz"
      sha256 "dad659917bc30134ff782c27712164a6cc47948cea1d23f5b09ca0aa05750cb2"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.4-linux-x64.tar.gz"
    sha256 "41c3195a59212b2bcf7527effd1201da207ba0a711eb22457473e490b480ff98"
  end
  version "2024.9.4"
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
