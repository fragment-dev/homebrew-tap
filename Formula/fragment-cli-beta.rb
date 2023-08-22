require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3358.0.0-darwin-x64.tar.gz"
    sha256 "70c1a187857f86b2ade1af4c509f48a8d938659ea1b316920e8daff8cdd1d579"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3358.0.0-darwin-arm64.tar.gz"
      sha256 "ee12cab3969bb6d1687eff6bdedb563f076b99a5c3982266555bd5c696aaf95b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3358.0.0-linux-x64.tar.gz"
    sha256 "aaa19b2cee4fa220b157afd0d445e53824c0cb00f096821361f2bcdf24e9f71f"
  end
  version "3358.0.0"
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
