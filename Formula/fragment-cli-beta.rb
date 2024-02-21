require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4612.0.0-darwin-x64.tar.gz"
    sha256 "de73675e941da5211d3840ea8db90b9cf48a3f289ae6fc28efb50fd3837ba487"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4612.0.0-darwin-arm64.tar.gz"
      sha256 "41b02baa79b430ebfefcc609bbfeae0da1c3fc9796c053acd0f50704580272f8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4612.0.0-linux-x64.tar.gz"
    sha256 "7011fd5e6767bd148ad7ba008c12e9781ec65cae2f0df8e7978ef06030dea1df"
  end
  version "4612.0.0"
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
