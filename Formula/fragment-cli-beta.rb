require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4856.0.0-darwin-x64.tar.gz"
    sha256 "452d84c8101efaa8c239d72e158629adfc07164d51e034abde2fc682813add3f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4856.0.0-darwin-arm64.tar.gz"
      sha256 "a447da928f6dccfd3b625d6d846c82050426c15d7ee725b065ee706f87b7323e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4856.0.0-linux-x64.tar.gz"
    sha256 "449424441285cc376c91d289ddfecd33acf0c752c9484ba3a8009a995fc5e0fa"
  end
  version "4856.0.0"
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
