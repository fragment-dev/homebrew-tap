require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2980.0.0-darwin-x64.tar.gz"
    sha256 "a32f31182f916f1dce67e25214822f33f53703f483952afba49d2171f31017b9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2980.0.0-darwin-arm64.tar.gz"
      sha256 "0204eafe8a991ac6b0b317d593921a61ea9332b869843351d755eb3c1da53ad5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2980.0.0-linux-x64.tar.gz"
    sha256 "8bbcc2b9bc905727d40e3d7630f7d788598ea5af0b910c7dcaad40faf5f559f0"
  end
  version "2980.0.0"
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
