require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2495.0.0-darwin-x64.tar.gz"
    sha256 "990ab946a28fa047e7d61723f708a92511e501df5eb1b2f94b6f594a1b541fbc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2495.0.0-darwin-arm64.tar.gz"
      sha256 "a5504ca589d283842e8c517e013433f10b8fd98c87f043640ca22124e9e7063d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2495.0.0-linux-x64.tar.gz"
    sha256 "b6c5a983296c5414174b275f361a252a2955430a62290e381dcd1e2fdce9b176"
  end
  version "2495.0.0"
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
