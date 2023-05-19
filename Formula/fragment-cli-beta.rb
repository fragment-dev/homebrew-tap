require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2701.0.0-darwin-x64.tar.gz"
    sha256 "a7e785d5bebc310195862b37a3d32cc4d9d8daded5590139be3c865ae3eeea88"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2701.0.0-darwin-arm64.tar.gz"
      sha256 "8ad3359201e364f8582297e3293b5647656112ac56c411362edbfb07ac97daf5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2701.0.0-linux-x64.tar.gz"
    sha256 "5d031ca98346814804193fcca1235ca7bf9993fab129caa27adea9b92a48677f"
  end
  version "2701.0.0"
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
