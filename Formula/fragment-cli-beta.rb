require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2952.0.0-darwin-x64.tar.gz"
    sha256 "16cd525ffe0391534e585b1df045b1dd8761bdb49cc4823a3cfe4f62859e3b32"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2952.0.0-darwin-arm64.tar.gz"
      sha256 "15a8248adf17354b245e57674ca9502f9ced273f416e9ee51648e7f7faa15d34"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2952.0.0-linux-x64.tar.gz"
    sha256 "ffe190b741e6edde7b6d8562f0e877a85a57bbf26ef1ee341c861165a792eeea"
  end
  version "2952.0.0"
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
