require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3144.0.0-darwin-x64.tar.gz"
    sha256 "8bd6526d8f0cf3fd4a39986756ca211be51e640ffd5feb5cf53102cb117e250f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3144.0.0-darwin-arm64.tar.gz"
      sha256 "33368e0782fb3cd72fbf68ab67fac1a5e6981695ee2955984fce5afa335618be"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3144.0.0-linux-x64.tar.gz"
    sha256 "59d22f1f6b2b40ac77e93e8210259d558a8a1c248bb8cf1fc0608f107aee95c7"
  end
  version "3144.0.0"
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
