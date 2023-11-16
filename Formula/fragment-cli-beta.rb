require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4016.0.0-darwin-x64.tar.gz"
    sha256 "bc02c6139b6d39bfdddef03e795432daf853f7233ccf6bdab7f605aa2a824148"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4016.0.0-darwin-arm64.tar.gz"
      sha256 "8e4ff7004ccec9e5298e119802279da4ac8c5f230e775c72fc59a40714ed0f15"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4016.0.0-linux-x64.tar.gz"
    sha256 "2fd07d90ae6784054cea6899c8e81a44e9eacba9013c3bb61e50aa3bf4a95a2f"
  end
  version "4016.0.0"
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
