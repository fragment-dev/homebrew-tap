require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5128.0.0-darwin-x64.tar.gz"
    sha256 "4a1f4c5b9431ddf284928b5c4e73643fb205be5bb88ecac1456e6351881a9163"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5128.0.0-darwin-arm64.tar.gz"
      sha256 "77c9b69b1a42dbaf56b1e54222862a15477e952b8e656ddceb6ae797f0154ef0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5128.0.0-linux-x64.tar.gz"
    sha256 "571ba666c41594496280e134bf52b1d9de60d0be2b1eda741b0f31364a963b85"
  end
  version "5128.0.0"
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
