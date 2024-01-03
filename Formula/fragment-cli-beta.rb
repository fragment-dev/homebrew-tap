require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4257.0.0-darwin-x64.tar.gz"
    sha256 "9ddc7932e73a160b084baf5b33933eb8a88f4aa4e64e556ee371c96b79a58f5e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4257.0.0-darwin-arm64.tar.gz"
      sha256 "36db7b4f1ca6c6c453657083a3a7cbd74ae1c70c6e19b77bd0001617bfd0e8ba"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4257.0.0-linux-x64.tar.gz"
    sha256 "53a3bf77b7621ed1b9fb8c40887d88ff1a2e529a088ea081f36933bc87973351"
  end
  version "4257.0.0"
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
