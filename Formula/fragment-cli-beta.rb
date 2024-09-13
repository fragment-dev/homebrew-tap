require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5587.0.0-darwin-x64.tar.gz"
    sha256 "4974dfa5b1f62b8785cad0f0071242dc954edca6e7e08178eff952133255ec9d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5587.0.0-darwin-arm64.tar.gz"
      sha256 "17e5c1d8ac2e8ae4e2a839bea34ab83435567e02c18cb154fc74efa67740311f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5587.0.0-linux-x64.tar.gz"
    sha256 "cb922e577fc0470d28516cdad9f33fe1311594c69be403b62f2746f8a8843d19"
  end
  version "5587.0.0"
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
