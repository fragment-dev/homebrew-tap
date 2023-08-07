require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3251.0.0-darwin-x64.tar.gz"
    sha256 "26ffd99b3f95bad4f28588e6d1b18f156ab406b2f9600c5bae2d714fe1ee7008"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3251.0.0-darwin-arm64.tar.gz"
      sha256 "6c91c3f515738659f69b8b56bde351847875d2eea9593121315bbc89d77303ad"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3251.0.0-linux-x64.tar.gz"
    sha256 "e0cedc3e569e29b9ab559de5d0bbd79066875cedef25f35a2d701b75e790ead6"
  end
  version "3251.0.0"
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
