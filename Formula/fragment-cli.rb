require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.8.8-darwin-x64.tar.gz"
    sha256 "44af2b73bd3a40929f7fdc4a667efcbd3dbccfe06a689b21ddd8cb47835026bc"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.8.8-darwin-arm64.tar.gz"
      sha256 "3473440fe44e241541e79b69e3f5ca693bfc603d3e560a650c2fa3e75bb88d61"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.8.8-linux-x64.tar.gz"
    sha256 "3294e13d63a3c329eb46d7902a4ad40c4de4975c3d747aae5b91ac5e48b14939"
  end
  version "2025.8.8"
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
