require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2842.0.0-darwin-x64.tar.gz"
    sha256 "077c108cc9256f31d5ab485817a9e10354a0a5094d53adf78967dc8f4651c16c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2842.0.0-darwin-arm64.tar.gz"
      sha256 "74688bf859577e316385a35f02f45f1a4eda33e23a6dc79888918c5e75962ddc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2842.0.0-linux-x64.tar.gz"
    sha256 "bb8c4066d9bd070c7fd6c08d50c38ef88e05e57adc0a4b687ad67c77e0f29de6"
  end
  version "2842.0.0"
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
