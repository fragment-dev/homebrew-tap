require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2325.0.0-darwin-x64.tar.gz"
    sha256 "c4a1028daf2586c82969c72ba094da5677de03abbb2b665602dcb4d70c212aeb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2325.0.0-darwin-arm64.tar.gz"
      sha256 "2230593e195e556238359148399e716f9a4990adb18252002be1dd01836cea10"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2325.0.0-linux-x64.tar.gz"
    sha256 "25b37177069660026f2769042e064b03b63d77064b834426c3b8ca3e92045b4a"
  end
  version "2325.0.0"
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
