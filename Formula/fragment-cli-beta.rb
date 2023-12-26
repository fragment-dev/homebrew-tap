require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4218.0.0-darwin-x64.tar.gz"
    sha256 "821f1f4376a69b93802a6d4aceeb87732f2119de11418e238fa0fd528256784f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4218.0.0-darwin-arm64.tar.gz"
      sha256 "bf1e8cef3cf31ed91a31a3ac93c75df5e8bc40fa9e73d314b58f1b5ca3814c26"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4218.0.0-linux-x64.tar.gz"
    sha256 "3b4021700fb7cd619497fe737923ec2deb087738676020a2ce7b36a588ba3718"
  end
  version "4218.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
