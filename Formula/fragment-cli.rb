require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.4.2-2-darwin-x64.tar.gz"
    sha256 "c7d4c22db781dd76fff2f00f096ec80279370aede3bdcf78ed195a788bc14b5a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.4.2-2-darwin-arm64.tar.gz"
      sha256 "b58f65d53182dd4cbecaa422f83f4baeeb1063d559b98c636cc64c34d823ae3d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.4.2-2-linux-x64.tar.gz"
    sha256 "b2bd86b33c337d833c3c0724fbb1cb81ffdc7a02d6c0ecfb4e0aeac5f36dd35f"
  end
  version "2026.4.2-2"
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
