require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2506.0.0-darwin-x64.tar.gz"
    sha256 "dce643de019b37c09b7e56ea1ad6c95ab77a9d725e82934547730c701e4b6849"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2506.0.0-darwin-arm64.tar.gz"
      sha256 "bce9a06bf9c6ffd4eb6cc08915ab0d37ca018a563eb65636edb2f1d79ac2d279"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2506.0.0-linux-x64.tar.gz"
    sha256 "90960105ab8aa7210219ec868aabec35ad5c773d476615a931c7cd916395b2c4"
  end
  version "2506.0.0"
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
