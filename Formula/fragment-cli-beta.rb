require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2643.0.0-darwin-x64.tar.gz"
    sha256 "fdfe528b5e41c86fb5464c1a58a030fbac9ba900155be4098f4a7267f0f6f7fb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2643.0.0-darwin-arm64.tar.gz"
      sha256 "9b32c476feee8da7b94f499bdf017c3867a8a6b6bd66185bdc4bf73ba9c403b5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2643.0.0-linux-x64.tar.gz"
    sha256 "63b62e17da6749894224c982491b4b0b125a67710a84fdc2293e25a424718eb0"
  end
  version "2643.0.0"
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
