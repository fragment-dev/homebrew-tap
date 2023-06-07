require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2817.0.0-darwin-x64.tar.gz"
    sha256 "09b3bd8c3a766a0eb011b8ab3dbe3ae088e009e057ae1b949f911a572d62ab37"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2817.0.0-darwin-arm64.tar.gz"
      sha256 "af4da608cbb7700586e11ed7fe8162bb15400adddf56d46b70b79629f611edb2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2817.0.0-linux-x64.tar.gz"
    sha256 "26e0caeb98bbfda01175bdd97e5e8cacf36edd07338d2e76e0d781f18ad6ad4c"
  end
  version "2817.0.0"
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
