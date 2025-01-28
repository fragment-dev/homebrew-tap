require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6132.0.0-darwin-x64.tar.gz"
    sha256 "9ccc681122e8a598297679c34f35f5691d0742bf30442c74663906688558385d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6132.0.0-darwin-arm64.tar.gz"
      sha256 "36b998824e33c7d1b22605dfa4235d596c59bd7b577502d794b50402e6b4f152"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6132.0.0-linux-x64.tar.gz"
    sha256 "b2f9ac46d334d4611e397a4d20f9d09c0b5db338494c073d91af5c71123528e0"
  end
  version "6132.0.0"
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
