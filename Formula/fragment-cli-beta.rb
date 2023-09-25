require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3663.0.0-darwin-x64.tar.gz"
    sha256 "7b282437a954f80a73df99158240e38f0f43c1d215424e18cc5c39d96f86024a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3663.0.0-darwin-arm64.tar.gz"
      sha256 "729bbb4bd46958588ecd2f2095f63ac42e383d38ed5b6c3d483c3a5c00e9de34"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3663.0.0-linux-x64.tar.gz"
    sha256 "549b3ef51a20c18192feda1d912d2bc7308cba7bd9611a8faf76f1e44a7774df"
  end
  version "3663.0.0"
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
