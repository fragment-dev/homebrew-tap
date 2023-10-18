require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3859.0.0-darwin-x64.tar.gz"
    sha256 "f4841d611c42f27b81dbc9aaedebbcc46ed879f3d4ee2a48a122a76a31726883"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3859.0.0-darwin-arm64.tar.gz"
      sha256 "651201bba3536b7acd4fffc825be79abadc819e5a8d73ebb5ffb553b43757e81"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3859.0.0-linux-x64.tar.gz"
    sha256 "51f399eccbaca149a362b49a9c039158c4f6102cac187fd308e68991f4e86c00"
  end
  version "3859.0.0"
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
