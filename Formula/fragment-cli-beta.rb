require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4655.0.0-darwin-x64.tar.gz"
    sha256 "b9b3074373dea154b354fefd26f3013c2a4276144cf21d4a27a4a64bc2c0872b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4655.0.0-darwin-arm64.tar.gz"
      sha256 "909bf56320ffbf9e2e5f0238c0953207aa48da6c04baf6f266adb580cd46fee8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4655.0.0-linux-x64.tar.gz"
    sha256 "67e22af55bdf06a96587ab267fdb87749f8db010a3e3993ef62bfaa03c36fcc9"
  end
  version "4655.0.0"
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
