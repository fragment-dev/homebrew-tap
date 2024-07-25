require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5438.0.0-darwin-x64.tar.gz"
    sha256 "e88603f93ea6c5a1fcc282e0eb586e60bb994bbb84017f17189667b3d2fd46d5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5438.0.0-darwin-arm64.tar.gz"
      sha256 "4275ffd5f766a74e8daa032368b4190a37667e99f102a059a7301c154998b0ec"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5438.0.0-linux-x64.tar.gz"
    sha256 "e8af94e5a71b27d6933250199dd14471ed8ae88118331957db62e0e492515fc2"
  end
  version "5438.0.0"
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
