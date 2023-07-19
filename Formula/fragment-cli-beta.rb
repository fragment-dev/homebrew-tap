require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3132.0.0-darwin-x64.tar.gz"
    sha256 "871fb55b6dc0ca6802dd7df8ab12ca03507f626f925243ef0a148ef6f02134d0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3132.0.0-darwin-arm64.tar.gz"
      sha256 "ee762f5ddddca31559eb11ddf3fc49eaf324ac847eb2830c6cc66b853304997d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3132.0.0-linux-x64.tar.gz"
    sha256 "039ebd6b4e40d4d301ea0b9e934ab3b5758fede7afbe8aeb8c6eb94f94a18f98"
  end
  version "3132.0.0"
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
